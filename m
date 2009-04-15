From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 15 Apr 2009 15:50:01 +0200
Subject: [Buildroot] OpenSSL build system knowledge somewhere ?
In-Reply-To: <20090415154103.53f867d1@surf> (Thomas Petazzoni's message of
	"Wed\, 15 Apr 2009 15\:41\:03 +0200")
References: <49E16433.9010707@comcast.net>
	<87fxgcbfcp.fsf@macbook.be.48ers.dk> <20090413220823.210225fe@surf>
	<49E3FEAF.7040705@comcast.net> <20090414090907.2c297e77@surf>
	<20090414104134.6b4d0362@surf> <20090415110647.1bf85daa@surf>
	<87ab6i9irh.fsf@macbook.be.48ers.dk> <20090415154103.53f867d1@surf>
Message-ID: <87vdp681rq.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> From a quick look it seems to just be a matter of adding
 >> CFLAG='$(TARGET_CFLAGS) <extra flags>' on the make command line, where
 >> <extra flags> are the flags openssl uses internally (something like
 >> -DOPENSSL_THREADS -D_REENTRANT -DDSO_DLCFN -DHAVE_DLFCN_H -DTERMIO).

 Thomas> How do I know, in a proper way, what these <extra flags> are ? (I mean,
 Thomas> without hardcoding them in Buildroot's .mk file)

You don't. Either you do like we used to do and fix the makefile with
sed (s/^CFLAG = /CFLAG = -sysroot .../) and live with the fact that
openssl likes to compile with -O3 no mather what optimization level
you have selected in BR, or you hardcode the list in openssl.mk (it
probably doesn't change that often).

 >> The question is why is all of a sudden failed?

 Thomas> I have no idea, I've never myself compiled openssl with
 Thomas> external toolchain.

Ahh ok.

 Thomas> What's your suggestion to work around the issue ?

One of the options above (hardcoded list or sed invocation).

 Thomas> Moreover, the --sysroot option is just part of
 Thomas> $(TARGET_CFLAGS), which might as well contain other flags
 Thomas> (march, mtune, mcpu, Os, O2 or whatever), so the .mk should
 Thomas> be written so that the build process of all packages really
 Thomas> take into account $(TARGET_CFLAGS). And if they do, then
 Thomas> there's no point in adding a wrapper script specially for the
 Thomas> --sysroot case.

Ok.

-- 
Bye, Peter Korsgaard
