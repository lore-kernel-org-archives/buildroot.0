From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 10 May 2017 14:12:40 +0100
Subject: [Buildroot] [PATCH v2 next] flex: bump version to 2.6.4
In-Reply-To: <20170510140308.3e7041f9@free-electrons.com>
References: <20170510113123.36929-1-Vincent.Riera@imgtec.com>
 <20170510140308.3e7041f9@free-electrons.com>
Message-ID: <7a74c03c-9910-cccd-d8c1-5f2ebe61fec0@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 10/05/17 13:03, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, 10 May 2017 12:31:23 +0100, Vicente Olivert Riera wrote:
> 
>> - The sed command over Makefile.in to prevent the flex binary to be
>>   built fails, so remove it. Instead, just remove the flex binary and
>>   its flex++ symlink using a post-target-install hook.
> 
> Have you tried to build this with a noMMU toolchain? I believe it will
> fail to build, because the flex program uses fork().

you're right, it fails to build with a noMMU toolchain because of fork():

flex-filter.o: In function `filter_apply_chain':
filter.c:(.text+0x1bc): undefined reference to `fork'

So, either we make flex package depend on MMU, or we prevent the flex
binary to be compiled. I prefer the second option.

I'll try to see how we can do it.

Regards,

Vincent.

> 
> Thomas
> 
