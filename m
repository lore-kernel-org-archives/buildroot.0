From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 25 May 2019 19:06:09 +0200
Subject: [Buildroot] [PATCH 1/1] package/tzdata and package/zic: bump to
 version 2019a
In-Reply-To: <20190518211320.3c2b6bf3@windsurf>
References: <20190517174019.65050-1-aduskett@gmail.com>
 <20190518211320.3c2b6bf3@windsurf>
Message-ID: <fb1b7804-cd53-3bd1-2956-feab8b6d7df9@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18/05/2019 21:13, Thomas Petazzoni wrote:
> Unfortunately, this breaks "make legal-info":
> 
>>>> tzdata 2019a Collecting legal info
> sha512sum: /home/thomas/projets/buildroot/output/build/tzdata-2019a/LICENSE: No such file or directory
> ERROR: LICENSE has wrong sha512 hash:
> ERROR: expected: 9fe102f8894714cd0bd7d72a92e5ca29e4f75ff3f802d6fc363d5349b83345251b1d572a35321bd487cc70485da337b90df0cd37f896b6343f6f4c29cba7a295
> ERROR: got     : 
> ERROR: Incomplete download, or man-in-the-middle (MITM) attack
> make[1]: *** [package/tzdata/tzdata.mk:65: tzdata-legal-info] Error 1
> 
> This is due to the fact that tzdata for the target is not extracted
> (TZDATA_EXTRACT_CMDS is empty).
> 
> So either we need to extract at least the LICENSE file, or perhaps we
> could extract it normally, it's just 4.5 MB of data anyway.

 Actually, we should probably get rid of the split between tz and tzdata,
because now the logic is really confusing IMO.

 Regards,
 Arnout
