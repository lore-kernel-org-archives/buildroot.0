From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue, 17 Dec 2019 19:00:37 +0100
Subject: [Buildroot] [PATCH 1/3] package/sqlite: remove workaround when
 building with gcc version <= 4.9
In-Reply-To: <20191217175059.49ec6076@windsurf>
References: <20191217143704.51115-1-giulio.benetti@benettiengineering.com>
 <20191217143704.51115-2-giulio.benetti@benettiengineering.com>
 <20191217175059.49ec6076@windsurf>
Message-ID: <9c0dc904-213a-3e0f-3b5a-685f6d931ff9@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/17/19 5:50 PM, Thomas Petazzoni wrote:
> On Tue, 17 Dec 2019 15:37:02 +0100
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
>> Gcc version 4.9 is not supported anymore by Buildroot so let's remove
>> the check for using a work-around.
> 
> This is not quite true: we no longer support building a toolchain with
> gcc 4.9, but we do support external toolchains that use gcc 4.9 or
> older. For example, the br-arm-full.config toolchain fragment is
> testing a gcc 4.9 based toolchain in the autobuilders.

Oops, I've just check now in toolchain/Config.in that it's supported gcc 
version >= 4.3

So let's drop this patch, sorry for the noise.

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
