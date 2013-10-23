From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 23 Oct 2013 16:52:23 +0200
Subject: [Buildroot] [PATCH] packages/Config.in: more alphabetical
	sorting
In-Reply-To: <CAGduivwuBD2G2pA7r++d9eFfPE+hFhAWzGA=TOS0riE4nBgr-w@mail.gmail.com>
References: <1382349586-8197-1-git-send-email-maxime.hadjinlian@gmail.com>
 <CAAXf6LWoi82w_eyJuvm3=8+6Xkvr32BxqmtbrWT=0yC4oovocQ@mail.gmail.com>
 <CAGduivwuBD2G2pA7r++d9eFfPE+hFhAWzGA=TOS0riE4nBgr-w@mail.gmail.com>
Message-ID: <CAAXf6LU1qvKCFA8dz5t2j_du=599xGwkFoQpEHj09vtCY3advg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Maxime,

On Wed, Oct 23, 2013 at 4:25 PM, Maxime Hadjinlian
<maxime.hadjinlian@gmail.com> wrote:
> On Wed, Oct 23, 2013 at 3:24 PM, Thomas De Schampheleire
> <patrickdepinguin@gmail.com> wrote:
>> Anyway, I don't think we should sort on the full line, but rather on
>> the package name, hence gstreamer < gstreamer1.
> Since the full line is the same for every packages, it should not
> matter during the sort if the locale used is C, should it ?

It does. Consider this:

$ echo -e 'gstreamer/Config\ngstreamer1/Config' | sort
gstreamer1/Config
gstreamer/Config
$ echo -e 'gstreamer/Config\ngstreamer1/Config' | LC_ALL=C sort
gstreamer/Config
gstreamer1/Config

If you don't use C locale, sort ignores the slash, while with C locale
the slash is taken into account.
So in the first case, you compare 1 with C, while in the second case,
you compare 1 with /.

Best regards,
Thomas
