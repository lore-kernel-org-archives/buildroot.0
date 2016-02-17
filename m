From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 17 Feb 2016 23:22:38 +0100
Subject: [Buildroot] [PATCH v2 1/1] libcapn : new package
In-Reply-To: <20160217221900.1ee0f081@free-electrons.com>
References: <1455732246-27866-1-git-send-email-sagaert.johan@proximus.be>
 <20160217221900.1ee0f081@free-electrons.com>
Message-ID: <56C4F2AE.7020806@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17-02-16 22:19, Thomas Petazzoni wrote:
> Hello Johan,
> 
> Thanks for this patch! See some comments below.
> 
> On Wed, 17 Feb 2016 19:04:06 +0100, Sagaert Johan wrote:
[snip]
>> +LIBCAPN_CONF_OPTS = -DCMAKE_BUILD_TYPE=Release \
> 
> This is already passed by the CMake package infrastructure, so it is
> useless (and wrong when BR2_ENABLE_DEBUG is enabled).
> 
>> +  -DAPN_HAVE_GLIBC_STRERROR_R=OFF \
>> +  -DAPN_HAVE_POSIX_STRERROR_R=OFF \
>> +  -DAPN_HAVE_GLIBC_STRERROR_R__TRYRUN_OUTPUT=OFF \
>> +  -DAPN_HAVE_POSIX_STRERROR_R__TRYRUN_OUTPUT=OFF 
> 
> I'm pretty sure those could be set to "ON" when glibc is used, but I
> guess OFF is a sane default, and if it builds and works this way, fair
> enough.

 As I explained in the original discussion I had with Johan: even on glibc, the
POSIX version of strerror_r will be used because the CMakeLists.txt also adds
-D_POSIX_C_SOURCE=200112L and doesn't add -D_GNU_SOURCE.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
