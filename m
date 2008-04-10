From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 10 Apr 2008 09:03:24 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/dropbear
In-Reply-To: <20080409223324.GB4582@cloud.net.au> (Hamish Moffatt's message of
	"Thu\, 10 Apr 2008 08\:33\:25 +1000")
References: <20080409073513.408C43C436@busybox.net>
	<20080409223324.GB4582@cloud.net.au>
Message-ID: <8763uqchtv.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hamish" == Hamish Moffatt <hamish@cloud.net.au> writes:

Hi,

 >> Added:
 >> trunk/buildroot/package/dropbear/S50dropbear

 Hamish> How about a configuration item to control installation of the init
 Hamish> script? I want to start dropbear from inetd instead.

Hmm, we would need to handle than more generically than just for
dropbear. Do you use a custom device_table.txt? Maybe the easiest is
simply to remove the execute permission on the init script with the
device table, then your rcS shouldn't run it.

-- 
Bye, Peter Korsgaard
