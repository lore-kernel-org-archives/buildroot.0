From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 29 Jan 2013 18:50:41 +0100
Subject: [Buildroot] [PATCH v3] pkg-infra: add <pkg>_CONFIG_FIXUP to fix
 *-config files
In-Reply-To: <CAHXCMMK69aYc=Hebivu1wPJOn0CXMn9SHQCA=-G4_JAdaw5Sjg@mail.gmail.com>
References: <1359402723-5603-1-git-send-email-stefan.froberg@petroprogram.com>
 <CAHXCMMK69aYc=Hebivu1wPJOn0CXMn9SHQCA=-G4_JAdaw5Sjg@mail.gmail.com>
Message-ID: <51080BF1.3020009@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 29/01/13 08:14, Samuel Martin wrote:
>> >+                       $(SED)  "s,^\(exec_\)\?prefix=.*,\1prefix=$(STAGING_DIR)/usr,g" \
>> >+                               -e "s,-I/usr/,-I\${prefix}/usr/,g" \
>> >+                               -e "s,-L/usr/,-L\${exec_prefix}/usr/,g" \
> Well, just fixing the (exec_)?prefix may not be enough in some case:
> Some quick grepping in the package directory will show that includedir
> and libdir should be fixed as well.

  I wouldn't want to do too much in the generic fixup script.

  In fact, the -L substitution is not necessarily correct - some config 
scripts may not define ${exec_prefix}. I'd rather use $(STAGING_DIR) 
explicitly.

  BTW, Stefan: the $ should have been quoted ($$).

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
