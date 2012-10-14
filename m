From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 14 Oct 2012 14:50:16 +0200
Subject: [Buildroot] [PATCH v2] Add target to create a project directory
In-Reply-To: <5079FAAC.3070803@gmail.com>
References: <20121013231443.17317.60675.stgit@localhost>
 <20121013232039.19428.5883.stgit@localhost> <5079FAAC.3070803@gmail.com>
Message-ID: <507AB508.2000503@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14/10/12 01:35, Valentine Barshak wrote:
>> +$(BUILDROOT_DIR):
>> +    mkdir -p $@
>> +    wget -O - $(BUILDROOT_SITE)/$(BUILDROOT_SOURCE) | \
>> +        tar -xjf - -C $@ --strip-components=1
>> +    for p in `ls $(makedir)/patches/buildroot/buildroot-* 2>/dev/null`; do \
>> +        patch -d $@ -p1 -i $$p; \
>> +    done
>
> I probably miss something, but
> do I have to download buldroot for every project?
> Can I use my local BR git tree as a buildroot source for my projects instead of downloading?

  No, make a symlink to the BR tree and it won't download anything.

  But this automatic download feature is probably going a bridge too far :-)

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
