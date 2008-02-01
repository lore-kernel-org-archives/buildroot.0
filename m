From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 1 Feb 2008 09:20:56 +0100
Subject: [Buildroot] make clean not so clean
In-Reply-To: <1201844203.3526.46.camel@localhost.localdomain>
References: <214360.55769.qm@web56410.mail.re3.yahoo.com>
	<1201844203.3526.46.camel@localhost.localdomain>
Message-ID: <20080201082056.GA32415@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Feb 01, 2008 at 12:36:43AM -0500, Ormund Williams wrote:
>On Thu, 2008-01-31 at 21:02 -0800, jake sullivan wrote:
>> I'm not sure how to go about fixing this, but I have been able to
>> recreate an annoying little bug (that I think is the source of a
>> number of other newb problems).
>> 
>...(snip)...
>> My gut says to update "make clean" to delete all the config files (and
>> basically everything but the source files), but before I put work into
>> making and testing a patch, I want to make sure that is the right
>> approach...
>> 
>Don't know about "Right Appraach", but I just locate my download
>directory outside the Buildroot tree.
>
>Under: Build Options --->
>
>	$(BASE_DIR)/../dl) Download dir

This historical behaviour is indeed annoying. Note that distclean only
deletes the DL_DIR if it is set to the default ("$(BASE_DIR)/dl"). I
usually set it to $(BASE_DIR)/down due to this slightly inconvenient
behaviour.

Changing this behaviour is easy, but how should DL_DIR be cleaned-out?
make dl-clean?
Suggestions for a better name for the target?
