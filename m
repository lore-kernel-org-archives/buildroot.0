From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 15 Apr 2009 16:28:52 -0300
Subject: [Buildroot] OpenSSL build system knowledge somewhere ?
In-Reply-To: <87vdp681rq.fsf@macbook.be.48ers.dk>
References: <49E16433.9010707@comcast.net>	<87fxgcbfcp.fsf@macbook.be.48ers.dk>
	<20090413220823.210225fe@surf>	<49E3FEAF.7040705@comcast.net>
	<20090414090907.2c297e77@surf>	<20090414104134.6b4d0362@surf>
	<20090415110647.1bf85daa@surf>	<87ab6i9irh.fsf@macbook.be.48ers.dk>
	<20090415154103.53f867d1@surf> <87vdp681rq.fsf@macbook.be.48ers.dk>
Message-ID: <49E63574.9070707@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard wrote:

>  Thomas> How do I know, in a proper way, what these <extra flags> are ? (I mean,
>  Thomas> without hardcoding them in Buildroot's .mk file)
> 
> You don't. Either you do like we used to do and fix the makefile with
> sed (s/^CFLAG = /CFLAG = -sysroot .../) and live with the fact that
> openssl likes to compile with -O3 no mather what optimization level
> you have selected in BR, or you hardcode the list in openssl.mk (it
> probably doesn't change that often).

Ok this patch fixes it for me.
Tested plain snapshot with an external toolchain and it fails, patch and
it's fixed, i suggest Thomas gives it a spin too.
Also moved c_rehash removal to always since it depends on perl and i
doubt anyone uses it.
However there are other failures i've seen with external toolchain support.
First in line was sstrip, it doesn't get built when external toolchain
is on and it's not a standard toolchain tool so it should be strip-only
when using external or build it as usual.
Second is openntpd that doesn't like my toolchain prefix.
And i left it there, it's not like i'm too interested in external
toolchains ;-)
Enjoy.
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: buildroot-openssl-external-toolchain.patch
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090415/1005056b/attachment.diff>
