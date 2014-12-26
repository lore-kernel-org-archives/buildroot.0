From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Date: Fri, 26 Dec 2014 21:45:42 +0100
Subject: [Buildroot] [PATCH 1/1] util-linux: Add an option to compile
 'nsenter' binary.
In-Reply-To: <20141226210225.461140c6@free-electrons.com>
References: <1419331450-820-1-git-send-email-nicolas.cavallari@green-communications.fr>
 <20141226210225.461140c6@free-electrons.com>
Message-ID: <549DC8F6.3080403@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 26/12/2014 21:02, Thomas Petazzoni wrote:
> Dear Nicolas Cavallari,
> 
> On Tue, 23 Dec 2014 11:44:10 +0100, Nicolas Cavallari wrote:
>> nsenter is a tool to enter the namespace of another process.
>>
>> Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
>> ---
>>  package/util-linux/Config.in     | 5 +++++
>>  package/util-linux/util-linux.mk | 1 +
>>  2 files changed, 6 insertions(+)
> 
> Thanks, applied after adding a Config.in condition to make sure that we
> don't enable this option if we have kernel headers older than 3.0: the
> setns() system call was added in Linux 3.0.

I'm not so sure now ... The fallback uses SYS_netns, instead of the
kernel's __NR_setns, so i assume that there must be some C library
support ... uclibc does define SYS_netns to be __NR_setns, so i think
the problem is still valid if the toolchain does not define SYS_setns.
