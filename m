From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Apr 2017 17:19:49 +0200
Subject: [Buildroot] [PATCH v2 1/2] cracklib: New package
In-Reply-To: <20170405124234.7035-1-stefan.sorensen@spectralink.com>
References: <20170405124234.7035-1-stefan.sorensen@spectralink.com>
Message-ID: <20170406171949.5a13b942@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Stefan,

On Wed,  5 Apr 2017 14:42:33 +0200, Stefan S?rensen wrote:
> Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
> ---

I still see the same behavior:

/home/thomas/projets/buildroot/output/host/usr/sbin/cracklib-format /home/thomas/dl/cracklib-words-2.9.6.gz | /home/thomas/projets/buildroot/output/host/usr/sbin/cracklib-packer /home/thomas/projets/buildroot/output/target/usr/share/cracklib/pw_dict
skipping line: 1
4 3
rm /home/thomas/projets/buildroot/output/target/usr/share/cracklib/cracklib-small

And then in the target:

$ ls -l output/target/usr/share/cracklib/*
-rw-r--r-- 1 thomas thomas  360 avril  6 17:17 output/target/usr/share/cracklib/cracklib.magic
-rw-r--r-- 1 thomas thomas 1024 avril  6 17:17 output/target/usr/share/cracklib/pw_dict.hwm
-rw-r--r-- 1 thomas thomas   50 avril  6 17:17 output/target/usr/share/cracklib/pw_dict.pwd
-rw-r--r-- 1 thomas thomas   16 avril  6 17:17 output/target/usr/share/cracklib/pw_dict.pwi

i.e, the dictionary is empty (size is ridiculously small).

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
