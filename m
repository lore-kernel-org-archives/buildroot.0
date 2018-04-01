From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 01 Apr 2018 01:16:14 -0300
Subject: [Buildroot] [PATCH 15/36] check-package: enable for toolchain/
References: <20180331083821.37eb87bd@windsurf>
Message-ID: <5ac05d0ec52e5_7cbc3fbe8f45291823d7@ultri4.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, Mar 31, 2018 at 03:38 AM, Thomas Petazzoni wrote:

>> But do not ignore this symbol:
>>  - GCONV_LIBS: it is used only inside the file that defines it.
> 
> You're not actually ignoring this variable in this patch, and you
> instead fixed it in PATCH 14/36 to have a TOOLCHAIN_ prefix.

I will remove this text from this patch and also from patches 8 and 12.
I first created the series changing the check-package and then fixing the
package files.
When I rebased before sending, to allow partial apply of the series, the info
"do not ignore this symbol" became obsolete since it is fixed in a previous
patch).

>> -CONFIG_IN_FILENAME = re.compile("/Config\.\S*$")
>> +CONFIG_IN_FILENAME = re.compile("/Config\.\S*$|/toolchain-common.in$")
> 
> Not directly related to your series, but I believe this
> toolchain-common.in file is silly. It is just included by
> toolchain/Config.in, and toolchain/Config.in is not that long. We
> should bring back the toolchain-common.in contents in
> toolchain/Config.in, and stop having this odd toolchain-common.in.

OK. I will do.


Regards,
Ricardo
