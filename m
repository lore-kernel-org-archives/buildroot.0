From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 30 Jun 2017 12:25:39 +0200
Subject: [Buildroot] [RFC PATCH v3 00/10] Make the SDK relocatable
In-Reply-To: <b883eedb-61e7-a49a-7ec1-39e17f05327b@grandegger.com>
References: <1490255693-9134-1-git-send-email-wg@grandegger.com>
 <6799ad7b-a16e-d89e-eb73-d7d91880d341@mind.be>
 <d993626e-11b0-ab21-f022-d64f6a7340b6@grandegger.com>
 <8b074253-3002-1db9-d902-a73bb47e734b@grandegger.com>
 <dec2b16c-50f5-15d2-2082-c31ca82170ec@mind.be>
 <6a236664-6cd5-c2e6-e4bc-ee5f7b6b21a1@grandegger.com>
 <311f5c7c-ad46-e1f1-4570-dfffb5605292@mind.be>
 <4243e8e2-baaf-37f5-4149-d085388f3b13@grandegger.com>
 <319491ac-9a65-f82f-892c-1e54b8df70da@mind.be>
 <b3e97095-7453-5516-0f23-e68e56932930@grandegger.com>
 <790e33dd-2285-dd7e-7203-692f2cd3686f@mind.be>
 <c9adbe27-c7b1-b28d-5c38-7c79a5da9c18@grandegger.com>
 <84234ca1-b75f-84da-80cc-83a7234d0927@mind.be>
 <d0246c22-0486-a095-0bf4-77cc14784997@grandegger.com>
 <681841f3-9d91-a2fe-d2ea-1282de1844e7@grandegger.com>
 <1cc2e254-a03b-f8e1-9e6f-bd250c1e2496@grandegger.com>
 <b883eedb-61e7-a49a-7ec1-39e17f05327b@grandegger.com>
Message-ID: <bda55ea2-7f4f-f176-9b44-6fd2660de5c9@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 30-06-17 11:14, Wolfgang Grandegger wrote:
> Hello, just another observation...
> 
> 
> $ find . -name '.br_host_filelist'|xargs grep sysroot
> ./build/host-gcc-final-6.3.0/.br_host_filelist:usr/arm-buildroot-linux-gnueabihf/sysroot/lib/libgcc_s.so.1
> ./build/host-gcc-final-6.3.0/.br_host_filelist:usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libstdc++.a
> ./build/host-gcc-final-6.3.0/.br_host_filelist:usr/arm-buildroot-linux-gnueabihf/sysroot/lib/libatomic.so.1.2.0
> ./build/host-gcc-final-6.3.0/.br_host_filelist:usr/arm-buildroot-linux-gnueabihf/sysroot/lib/libatomic.a
> ./build/host-gcc-final-6.3.0/.br_host_filelist:usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libstdc++.so.6.0.22
> ./build/host-gcc-final-6.3.0/.br_host_filelist:usr/arm-buildroot-linux-gnueabihf/sysroot/lib/libatomic.la
> ./build/host-gcc-final-6.3.0/.br_host_filelist:usr/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/libstdc++.so.6.0.22-gdb.py
> ./build/host-gcc-final-6.3.0/.br_host_filelist:usr/arm-buildroot-linux-gnueabihf/sysroot/lib/libgcc_s.so
> 
> GCC seems to install into "sysroot" in the "install-host" step. Not
> sure if this is a problem (needs special treatment).

 Good observation! I'll have to think about that one...

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
