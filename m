From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 14 Nov 2017 11:39:36 +0100
Subject: [Buildroot] Bug in RPATH fixing logic
In-Reply-To: <c56927b6-b854-36cb-5329-0e3f42f92ce7@grandegger.com> (Wolfgang
 Grandegger's message of "Tue, 14 Nov 2017 10:05:28 +0100")
References: <20171112174013.25d90333@windsurf.home>
 <20171112174955.18449728@windsurf.home>
 <87y3nbs9jz.fsf@dell.be.48ers.dk>
 <20171112182403.5d5c8fe4@windsurf.home> <20171112174250.GD2947@scaer>
 <734d391a-b9b9-d728-9878-4e8c4599b106@grandegger.com>
 <87d14ms2x2.fsf@dell.be.48ers.dk> <20171113173611.GB2861@scaer>
 <d632b876-9cbe-bbec-5195-d383b6ebd440@grandegger.com>
 <20171113203343.GC2861@scaer>
 <fbbec566-444f-39de-d23e-6b50de62294e@grandegger.com>
 <c56927b6-b854-36cb-5329-0e3f42f92ce7@grandegger.com>
Message-ID: <87ined2lg7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Wolfgang" == Wolfgang Grandegger <wg@grandegger.com> writes:

Hi,

 >>> I think providing a post-install hook is better than patching.
 >> 
 >> I agree.

 > You mean post-install for the "binutil" packages only? A generic
 > solution would be better, but not straight-forward, unfortunately.

I guess we could do something with find -type f -links +1 and then stat
those files to find the inode number and search for the other links with
find -inum <inode>, but yeah, it is not going to be pretty.

A package specific post-install hook is most likely going to be a lot
simpler/cleaner.

 > Do we want to have symbolic instead of hard links or is a special
 > RPATH with directories for all hard linked ELF files acceptable?

I think using symlinks is the simplest solution.

-- 
Bye, Peter Korsgaard
