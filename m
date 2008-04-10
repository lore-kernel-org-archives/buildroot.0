From: Nigel Kukard <nkukard@lbsd.net>
Date: Thu, 10 Apr 2008 14:11:59 +0000
Subject: [Buildroot] advice on makefile
In-Reply-To: <87tzi9apo6.fsf@macbook.be.48ers.dk>
References: <1207827171.6817.432.camel@nigel-x60>
	<87tzi9apo6.fsf@macbook.be.48ers.dk>
Message-ID: <1207836719.6817.433.camel@nigel-x60>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


>  Nigel> Problem is I don't want to depend on the fixed library names
>  Nigel> .... would you suggest I depend on
>  Nigel> $(STAGING_DIR)/usr/lib/libbeecrypt.so ... etc?
> 
> Yes, but that breaks parallel builds. You have to tell make that it
> cannot start the configure step until those other libraries are
> installed into STAGING_DIR.
> 
> I know that the current approach of having to hardcode the file name
> used in the library .mk isn't really nice. We should probably come up
> with an agreement regarding a fixed target name / file for libraries
> to clean this up. Notice that this has to be a physical file name as a
> PHONY target like <package>-staging-install always will be considered
> out-of-date, so the configure target will rerun everytime you run
> make.

What is going on in libxml2.mk?  I need to add libxml as one of the
deps  :)

-N
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 189 bytes
Desc: This is a digitally signed message part
Url : http://busybox.net/lists/buildroot/attachments/20080410/5fcd2c45/attachment.pgp 
