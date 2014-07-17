From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 17 Jul 2014 06:52:46 +0200
Subject: [Buildroot] [PATCH] u-boot: Allow to specify a list of patches
In-Reply-To: <53C6FB6D.2040903@mind.be>
References: <1405448794-10517-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <20140715205341.77237719@free-electrons.com>
 <CAAEAJfB7bjvsdGCOc+5Rzt39ERfvfC=sSYKtKUtGwDLXiBDLdA@mail.gmail.com>
 <20140715201336.GE3351@free.fr> <53C6FB6D.2040903@mind.be>
Message-ID: <29128166-5526-4da5-804d-72225bc05bc1@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout Vandecappelle <arnout@mind.be> schreef:
>On 15/07/14 22:13, Yann E. MORIN wrote:
>> The more I think about it, the more I find our policy to require
>> PKG-prefixed patches to be really cumbersome, since the patches already
>> are in a subdir named PKG/
>> 
>> Of course, we're enforcing this naming scheme in BR2_GLOBAL_PATCH_DIR to
>> be in sync with what we do for our bundled patches.
>> 
>> But still, if patches were just named NNNN-title.patch, that would be as
>> efficient at sorting the patches. The PKG- prefix is not really
>> required, and indeed can cause some troubles with some use-cases, such
>> as yours.
>> 
>> Thomas, was there a specific reason we wanted the patches to be
>> PKG-prefixed? If not, would it make sense to just accept patches without
>> a PKG-prefix?
>
> Er, we don't... We require this specific naming scheme for contributed
>packages, but the code itself just takes *.patch.

Yes sure, it's a convention only, but the question is: why did we include the package name in the convention?
