From: Petr Kulhavy <brain@jikos.cz>
Date: Sun, 9 Jul 2017 22:00:58 +0200
Subject: [Buildroot] [PATCH] package/linuxptp: remove incdefs.sh to
 avoid cross-compilation issues
In-Reply-To: <7f981b4f-8202-0df8-25aa-ba128b6d8e0b@smile.fr>
References: <20170705141028.28194-1-romain.naour@smile.fr>
 <7b3079cb-f604-6ab2-3da7-448dacf9ef55@jikos.cz>
 <6827f8c2-c2dc-5727-1844-109bd321a498@smile.fr>
 <f0e2c860-ca4e-bf3d-f685-ffc2f9915a8a@jikos.cz>
 <7f981b4f-8202-0df8-25aa-ba128b6d8e0b@smile.fr>
Message-ID: <03a699d8-a382-bc28-65b8-a5b94e96c92a@jikos.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain,

On 09/07/17 11:28, Romain Naour wrote:
> Do you have a link to your discussion ?
> I can understand that autotools maybe difficult to set up but reinvent the wheel
> is also difficult :p
> I would suggest to use cmake instead.

You can see the thread here, scroll down to "patch 4/4" where the 
relevant discussion starts:
https://sourceforge.net/p/linuxptp/mailman/linuxptp-devel/thread/20170523050744.GB1739%40localhost.localdomain/#msg35854067

> The issue seems to be fixed in the autobuilders [1] but we have to do some
> changes in linuxptp.mk.
>
> [1]
> http://autobuild.buildroot.net/?reason=linuxptp-97c351cafd7327fd28047580c9e2528a6f7e742b
>
I've seen the last failing auto-build. But that was before your patches 
have been applied.
So now it seems to be OK.

The path handling in kernel_flags() in incdefs.sh is a bit clumsy and 
obscure. But it seems to work now with the right environment variables 
set (in linuxptp.mk).
So I would stick to the advice "never touch a running system". For me 
the outcome is not worth the effort.

Regards
Petr
