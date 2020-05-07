From: Paul C Diem <PCDiem@FoxValley.net>
Date: Thu, 7 May 2020 17:10:21 -0500
Subject: [Buildroot] Package configure script environment
In-Reply-To: <20200507213137.01a886c6@windsurf.home>
References: <b0635a68-dae9-1e89-c352-1082e49990ad@FoxValley.net>
 <20200507213137.01a886c6@windsurf.home>
Message-ID: <97f9b10f-e246-4681-4812-3a541a959bbf@FoxValley.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am using the one from buildroot. buildroot-2020.02.1 does not include 
unbound. I pulled the unbound package info from 
https://git.buildroot.net/buildroot/tree/package/unbound?h=75021e0ceb841d743390a9fceff8d0ae4f513db2 
and that fails on the configure script because it can't find ssl.h. Like 
I said, it seems to be looking in my system's /usr/include directory 
instead of the host sysroot directory.

On 5/7/2020 2:31 PM, Thomas Petazzoni wrote:
> Hello,
>
> On Thu, 7 May 2020 12:59:04 -0500
> Paul C Diem <PCDiem@FoxValley.net> wrote:
>
>> I'm trying to find how buildroot execute package configure scripts.
>> Specifically, I'm trying to build unbound. It build fine under buildroot
>> 2019.02 but I'm having trouble under 2020.02.1. The problem is that the
>> ubnound configure script looks for include files (such as ssl.h) in
>> directories such as /usr. It appears that from the configure script's
>> perspective, /usr is the the /usr of the system I'm building on. It
>> seems it should be the host /usr from sysroot. I assume a lot of
>> configure scripts look for the existence of files in include and
>> libraries directories and I would have thought buildroot chroot'ed into
>> the host filesystem root when it ran the package configure scripts. Can
>> someone explain in what environment the package configure scripts are
>> executed?
> Why don't you use the "unbound" package that Buildroot has in
> package/unbound/ ? It is already integrated, and therefore solves all
> those cross-compilation issues for you.
>
> Rule: if you're building something manually against Buildroot, you're
> most likely wrong. You should be using an existing package, or create
> your own package.
>
> Hope this helps!
>
> Thomas
