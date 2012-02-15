From: Markos Chandras <Markos.Chandras@imgtec.com>
Date: Wed, 15 Feb 2012 11:09:11 +0000
Subject: [Buildroot] [PATCH] libatomic_ops: Remove duplicate targets
In-Reply-To: <201202142322.18176.arnout@mind.be>
References: <4F38DB27.5090707@imgtec.com> <201202142322.18176.arnout@mind.be>
Message-ID: <4F3B9257.3090806@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/14/2012 10:22 PM, Arnout Vandecappelle wrote:

> I don't see how the duplicates could be a problem... install (or
> 
> install-sh) will just overwrite it the second time. It has to,
> 
> otherwise running 'make install' a second time would fail. Basically,
> 
> it works for me.
> 

Hi Arnout,

Well it does not work for me because 'install' refuses to overwrite
newly created files

/usr/bin/install: will not overwrite just-created
`.../sysroot/usr/include/atomic_ops/sysdeps/gcc/hppa.h' with `gcc/hppa.h'
/usr/bin/install: will not overwrite just-created
`.../sysroot/usr/include/atomic_ops/sysdeps/gcc/ia64.h' with `gcc/ia64.h'
etc etc

and it then exists with Error 2

> 
> 
> 
> Of course, this is still relevant to send upstream.
> 


Yeah I will do it but given the author's comment "The prior, ostensibly
more stable, but seriously aging version is libatomic_ops-1.2." I am not
sure whether he stills maintain this version or not.

-- 
markos
