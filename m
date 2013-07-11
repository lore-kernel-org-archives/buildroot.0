From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 11 Jul 2013 14:02:34 +0200
Subject: [Buildroot] [PATCH] Makefile: unset MAKEFLAGS
In-Reply-To: <20130711134646.6ef211dd@skate>
References: <1373222539-8915-1-git-send-email-s.martin49@gmail.com>
 <CAEYzJUFzijo=jM+s4P_ZFAH-E_-MvhKZbcjHmNUBypiu5pF6zQ@mail.gmail.com>
 <20130711134646.6ef211dd@skate>
Message-ID: <201307111402.34152.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Thursday 11 July 2013 13:46:46 Thomas Petazzoni wrote:
> On Thu, 11 Jul 2013 12:33:42 +0200, Bj?rn Forsman wrote:
> > How about going all the way: clean out the environment completely, and
> > explicitly add env vars to builders as needed. That would result in a
> > more deterministic build environment, IMHO.
> 
> I don't think this works: there are a bunch of environment variables
> that we accept (to tune the uClibc config file, the Busybox config
> file, the host gcc to use, etc.). And we also accept the feature that
> all BR2_<foo> values can be overridden using environment variables. So
> I don't think wiping out the entire environment is possible. However,
> we could /maybe/ (if that's possible), wipe out the entire environment
> *except* the BR2_<foo> variables, and the few other variables that we
> explicitly accept. But I'm not sure how to achieve that.

Even that would not work. For example, I have LD_PRELOAD set to tsocksify
all network connections, without which I could not download anything.

So, even though LD_PRELOAD looks like a good candidate to dump, it can be
valid in some cases.

I believe it is much better that Buildroot chokes on a select list of
variables, warn about a few others, and accept the rest.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +0/33 662376056 | Software  Designer | \ / CAMPAIGN     |   ^                |
| --==< O_o >==-- '------------.-------:  X  AGAINST      |  /e\  There is no  |
| http://ymorin.is-a-geek.org/ | (*_*) | / \ HTML MAIL    |  """  conspiracy.  |
'------------------------------'-------'------------------'--------------------'
