From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Jan 2016 15:26:28 +0100
Subject: [Buildroot] [PATCH v9] toolchain: create symlink
	ARCH_LIB_DIR->lib in addition to lib32/lib64->lib
In-Reply-To: <CAAXf6LUUwQ4yt38Cy+A5QpL+kXhGmd9iiBvJLdNA8uJDv=TpMA@mail.gmail.com>
 (Thomas De Schampheleire's message of "Tue, 19 Jan 2016 15:17:07
 +0100")
References: <1450787734-2547-1-git-send-email-patrickdepinguin@gmail.com>
 <20160117154528.1bb05d3e@free-electrons.com>
 <CAAXf6LVkS49xBPa80iqi0EbkausB2gYJRJodsPMoWR8n6LZaAg@mail.gmail.com>
 <CAAXf6LUUwQ4yt38Cy+A5QpL+kXhGmd9iiBvJLdNA8uJDv=TpMA@mail.gmail.com>
Message-ID: <87lh7l3asr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

Hi,

>> In earlier versions of the patch, I stated that the symlink creation
 >> needs to happen before gcc-initial is built. This is the reason we are
 >> hooking into gcc-initial. This was also effectively the case before
 >> the skeleton package was introduced.

 > Small correction, the statement is:
 > +# The creation of lib32/lib64 symlinks into target and staging directories
 > +# needs to be done before the C library is installed.

And that's already the case, right? E.G. all packages depend on
skeleton, including the glibc/uclibc/musl packages.

E.G. from a build with an external toolchain:

1453212927:start:extract             : linux
1453212938:end  :extract             : linux
1453212938:start:patch               : linux
1453212939:end  :patch               : linux
1453213000:start:extract             : skeleton
1453213000:end  :extract             : skeleton
1453213000:start:patch               : skeleton
1453213000:end  :patch               : skeleton
1453213000:start:configure           : skeleton
1453213000:end  :configure           : skeleton
1453213000:start:build               : skeleton
1453213000:end  :build               : skeleton
1453213000:start:install-staging     : skeleton
1453213000:end  :install-staging     : skeleton
1453213000:start:install-target      : skeleton
1453213001:end  :install-target      : skeleton
1453213002:start:extract             : toolchain-external

-- 
Bye, Peter Korsgaard
