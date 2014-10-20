From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 20 Oct 2014 10:19:49 -0300
Subject: [Buildroot] [PATCH 1/2] system/skeleton: make nsswitch install
 conditional
In-Reply-To: <20141020150209.5f8b45a5@free-electrons.com>
References: <1413808086-12177-1-git-send-email-gustavo@zacarias.com.ar>
 <20141020150209.5f8b45a5@free-electrons.com>
Message-ID: <54450BF5.4000202@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/20/2014 10:02 AM, Thomas Petazzoni wrote:
>> +TARGET_FINALIZE_HOOKS += GLIBC_COPY_NSSWITCH_FILE
>> +endif
> 
> Also, I believe I'd prefer to see this being done in the glibc package
> and in the toolchain-external package. I know it's a bit redundant to
> have it twice, but I'd like to not have too many files that get
> installed through the finalize hooks.

Why? It doesn't write anything unless it's necessary and it's a pretty
small check.
And it's ok to duplicate code for this but not elsewhere? Isn't that
inconsistent?
Regards.
