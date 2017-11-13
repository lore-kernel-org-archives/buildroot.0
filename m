From: Wolfgang Grandegger <wg@grandegger.com>
Date: Mon, 13 Nov 2017 16:19:57 +0100
Subject: [Buildroot] Bug in RPATH fixing logic
In-Reply-To: <87d14ms2x2.fsf@dell.be.48ers.dk>
References: <20171112174013.25d90333@windsurf.home>
 <20171112174955.18449728@windsurf.home> <87y3nbs9jz.fsf@dell.be.48ers.dk>
 <20171112182403.5d5c8fe4@windsurf.home> <20171112174250.GD2947@scaer>
 <734d391a-b9b9-d728-9878-4e8c4599b106@grandegger.com>
 <87d14ms2x2.fsf@dell.be.48ers.dk>
Message-ID: <4d389dc8-cdfa-9185-7873-b19a062cfe96@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Am 13.11.2017 um 14:50 schrieb Peter Korsgaard:
>>>>>> "Wolfgang" == Wolfgang Grandegger <wg@grandegger.com> writes:
> 
> Hi,
> 
>   > This means: A symbolic link would work.
> 
> Ok, great - Makes sense. I wonder how much effort it wil be to get
> binutils to generate symbolic links instead of hard links.
> 

If I look into the HOST_DIR of my X86_64 build, I find the attached files
with hard links. For example "ar" is in:

./bin/x86_64-buildroot-linux-gnu-ar: Device: 811h/2065d	Inode: 52043071    Links: 2
./x86_64-buildroot-linux-gnu/bin/ar: Device: 811h/2065d	Inode: 52043071    Links: 2

$ patchelf --print-rpath ./bin/x86_64-buildroot-linux-gnu-ar
/work/agco/bdo/dcu/host/lib

And this RPATH will be removed for the known reasons. Trying to use
symbolic instead of hard links in the binutils now...

Wolfgang.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: hard-links-x86_64-build.log
Type: text/x-log
Size: 3092 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171113/fbbb79e4/attachment.bin>
