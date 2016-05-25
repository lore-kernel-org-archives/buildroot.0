From: =?UTF-8?Q?S=c3=a9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Wed, 25 May 2016 18:04:11 +0200
Subject: [Buildroot] [PATCH 1/1] support/scripts/apply-patches.sh:
 handle tar and mkdir failures
In-Reply-To: <20160525171145.6d8950d9@free-electrons.com>
References: <1464178439-3333-1-git-send-email-sebastien.szymanski@armadeus.com>
 <20160525171145.6d8950d9@free-electrons.com>
Message-ID: <7fd7c351-9916-5591-e308-42efeb652dfb@armadeus.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 05/25/2016 05:11 PM, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, 25 May 2016 14:13:59 +0200, S?bastien Szymanski wrote:
>> With several archives in a space-separated list of patches, if one archive
>> cannot be untar (i.e because it is not readable), Buildroot keeps going instead
>> of aborting. Fix this by checking the tar return code.
>> While at it, check if the unpack archive directory creation is successful.
>>
>> Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
>> ---
>>  support/scripts/apply-patches.sh | 6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> Thanks for the patch. One question though: are you actually using the
> capability of Buildroot to take a tarball, and apply the patches that
> it contains? If so, for what use case?
> 

Yes, we use this Buildroot feature. We have an old kernel with several
tarballs of patches for our i.MX28-based SoM. They was provided that way
by Freescale I guess.

Regards,

> Thanks,
> 
> Thomas
> 


-- 
S?bastien Szymanski
Software Engineer
Armadeus Systems - A new vision of the embedded world
sebastien.szymanski at armadeus.com
Tel: +33 (0)9 72 29 41 44
Fax: +33 (0)9 72 28 79 26
