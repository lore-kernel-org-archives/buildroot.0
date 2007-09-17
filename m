From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 17 Sep 2007 23:47:06 +0200
Subject: [Buildroot] r19351 broke make source [was: Re:
	svn	commit:trunk/buildroot: target/device target/device/Atmel
	targe	etc...]
In-Reply-To: <002c01c7f967$0ec70460$e9c4af0a@atmel.com>
References: <20070731145959.C5111A4595@busybox.net>
	<20070917092015.GA18644@aon.at> <20070917095034.GB19167@aon.at>
	<002c01c7f967$0ec70460$e9c4af0a@atmel.com>
Message-ID: <20070917214706.GP20058@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Sep 17, 2007 at 10:12:14PM +0200, Ulf Samuelsson wrote:
>> On Mon, Sep 17, 2007 at 11:20:15AM +0200, Bernhard Fischer wrote:

>>>This apparently broke 'make source'. Please fix ASAP or revert.
>
>That is good, because the culprit is the creation of BASE_TARGETS 
>for the toolchain, which removes the toolchain source from TARGETS 
>Thus "make source" fails to work, since there is no dependency on the
>toolchain tarballs.
>
>The log shows that this patch was submitted by one aldot at uclibc.org...

I stand corrected.
