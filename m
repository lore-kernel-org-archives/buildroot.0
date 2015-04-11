From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 11 Apr 2015 14:23:23 +0200
Subject: [Buildroot] [PATCH 2/3] package/rsyslog: Fix linking against
 postgresql
In-Reply-To: <20150411141520.4060c6a3@free-electrons.com>
References: <1428738737-3238-1-git-send-email-bernd.kuhls@t-online.de>
 <1428738737-3238-2-git-send-email-bernd.kuhls@t-online.de>
 <20150411124226.726fde30@free-electrons.com>
 <XnsA4798AC8357A8berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
 <20150411120739.GF4221@free.fr>
 <20150411141520.4060c6a3@free-electrons.com>
Message-ID: <20150411122323.GG4221@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Bernd, All,

On 2015-04-11 14:15 +0200, Thomas Petazzoni spake thusly:
> On Sat, 11 Apr 2015 14:07:39 +0200, Yann E. MORIN wrote:
> > Unfortunately, pg_config is a binary, so we provide our own minimalist
> > one, which does not implement --libs.
> 
> So, shouldn't we simply implement --libs in our own pg_config
> implementation?

Well, I thought that was pretty much obvious we should, yes.

However, I've had a quick look, and it's not that easy... :-(

For example, regarding the issue we're actually trying to solve: the
check rsyslog's ./configure does is eventually using _isnan() which is
in -lm, but nothing in the NEEDED of libpq.so suggests -lm is needed,
not even in the dependency chain (i.e. NEEDEDs of NEEDEDs...)

So, I can have a deeper and longer look, but that will be later. Unless
Bernd beats me to it, that is. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
