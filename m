From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 28 Mar 2008 22:13:42 +0100
Subject: [Buildroot] gcc 4.2.2 patch
In-Reply-To: <1206738222.3224.78.camel@nigel-x60>
References: <1206735722.3224.70.camel@nigel-x60> <20080328204136.GN1783@mx.loc>
	<1206738222.3224.78.camel@nigel-x60>
Message-ID: <20080328211342.GP1783@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Mar 28, 2008 at 09:03:42PM +0000, Nigel Kukard wrote:
>> close.
>> Correct would have been to use $(INSTALL). Also the for loop doesn't
>> make too much sense, fwiw.
>> 
>> Something like this should do everything that is needed and is not
>> bloated:
>> 	$(INSTALL) -D -m0755 $(patsubst %,$(STAGING_DIR)/sbin/%,$(LVM2_SBIN)) $(TARGET_DIR)/sbin/
>> 
>> Remember that this is *make* and not your favourite shell..
>
>Thanks, I'll keep that in mind. I've found quite a number of for's in
>the tree, if I come across them again I'll fix it.

Fair enough, but it would be nicer if you would take it upon you to fix
them in one sweep and once and for all. Every such occurance should be
fixed and no new occurance (or touch thereof) should be accepted into
the tree.
Same with all those (="??%?) touch /the/make_target. There is $@ and it
should be used for the sake of cleanlyness. I could go on with another
handful of such cruft but you get the idea..
