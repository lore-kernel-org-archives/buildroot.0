From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 8 Aug 2017 18:12:04 +0200
Subject: [Buildroot] [PATCH 1/1] linux-headers: aarch64: Prevent
 selecting unsupported versions
In-Reply-To: <20170806134011.30228-1-bernd.kuhls@t-online.de>
References: <20170806134011.30228-1-bernd.kuhls@t-online.de>
Message-ID: <c1220cdf-f5b4-d50b-b19e-2aa93ba90508@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06-08-17 15:40, Bernd Kuhls wrote:
> Versions older than Linux v3.7 do not support the aarch64 architecture
> so disable them, for reference see https://kernelnewbies.org/Linux_3.7
> 
> Without this patch these defconfigs fail to build
> 
> BR2_aarch64=y
> BR2_KERNEL_HEADERS_3_2=y
> 
> BR2_aarch64=y
> BR2_KERNEL_HEADERS_3_4=y
> 
> with error messages like this:
> 
> make[1]: Entering directory '/home/buildroot/br5_next/output/build/linux-headers-3.2.89'
> Makefile:567: /home/buildroot/br5_next/output/build/linux-headers-3.2.89/arch/arm64/Makefile: No such file or directory
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

 Applied to master, thanks.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
