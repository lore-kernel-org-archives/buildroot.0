From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Wed, 20 Aug 2014 15:59:13 +0000 (UTC)
Subject: [Buildroot] OT: Using oprofile on buildroot system
References: <lt2f4i$f16$1@ger.gmane.org>
Message-ID: <lt2gkh$6cb$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2014-08-20, Grant Edwards <grant.b.edwards@gmail.com> wrote:

> [...] when I try to run opcontrol, it appears to be
> trying to load a runtime kernel module:

Rats.  I was looking at the wrong kconfig variable.  Somebody told me
that oprofile support was enabled, and I saw that CONFIG_HAVE_OPROFILE
was set to 'y'. But, that doesn't mean you _have_ oprofile support
enabled.  After enabling the correct variable (CONFIG_OPROFILE), it
looks like it's working...

-- 
Grant Edwards               grant.b.edwards        Yow! I'm wearing PAMPERS!!
                                  at               
                              gmail.com            
