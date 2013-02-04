From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Feb 2013 21:42:22 +0100
Subject: [Buildroot] gcc 4.7.2 and arm OABI
In-Reply-To: <CAJXWAww6JFbdAYotGH1n2xEFJ=AFDrtEJEo=BhiRe4dCrtVr=g@mail.gmail.com>
References: <CAJXWAww6JFbdAYotGH1n2xEFJ=AFDrtEJEo=BhiRe4dCrtVr=g@mail.gmail.com>
Message-ID: <20130204214222.00cb3976@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear hayate,

On Mon, 4 Feb 2013 17:15:06 +0800, hayate wrote:
> The OABI is disabled in menuconfig with gcc 4.7.x, the latest gcc
> with OABI support is 4.6
> 
> But recently I found that if configure gcc 4.7 with
> --enable-obsolete, it can be built with OABI support
> (--with-abi=apcs-gnu)
> 
> Is there any possibility to build gcc 4.7 with OABI in buildroot?

Well, it seems that you know how to use OABI with gcc 4.7, so you can
make the necessary changes in Buildroot to make this happen:
 (1) Re-enable the possibility of selecting OABI even if gcc 4.7 is
 selected
 (2) Pass the --enable-obsolete gcc configure flag to gcc when gcc 4.7
 and OABI are selected.

That said, doing an OABI build today seems really, really awkward, and
I am not sure we will be really interested in a patch that explicitly
makes use of features considered obsolete by gcc people.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
