From: =?UTF-8?Q?DUPONCHEEL_S=c3=a9bastien?= <sebastien.duponcheel@corp.ovh.com>
Date: Fri, 23 Nov 2018 15:54:07 +0100
Subject: [Buildroot] [PATCH 1/1] botan: fix install directory
In-Reply-To: <20181123155053.2fd39fd5@windsurf>
References: <1542983259-6868-1-git-send-email-sebastien.duponcheel@corp.ovh.com>
 <20181123155053.2fd39fd5@windsurf>
Message-ID: <c4325080-6786-bafa-9f6a-03c9924934a5@corp.ovh.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi thomas,

Yes that is.

While i was working on a kea-dhcp package that depends on botan.
I see something weird with the botan install directory.

Before my patch :
output/target/usr/usr/lib/libbotan-2.so
output/target/usr/usr/lib/pkgconfig/botan-2.pc
output/target/usr/usr/lib/python2.7/site-packages/botan2.py
output/target/usr/usr/lib/libbotan-2.so.8.8.0
output/target/usr/usr/lib/libbotan-2.so.8
output/target/usr/usr/bin/botan

After my patch :
./output/target/usr/lib/libbotan-2.so
./output/target/usr/lib/python2.7/site-packages/botan2.py
./output/target/usr/lib/libbotan-2.so.8.8.0
./output/target/usr/lib/libbotan-2.so.8
./output/target/usr/bin/botan

Best regards,
DUPONCHEEL S?bastien

Le 23/11/2018 ? 15:50, Thomas Petazzoni a ?crit?:
> Hello,
>
> Thanks for your contribution!
>
> On Fri, 23 Nov 2018 15:27:39 +0100, DUPONCHEEL S?bastien wrote:
>> Signed-off-by: DUPONCHEEL S?bastien <sebastien.duponcheel@corp.ovh.com>
> It would be nice to have a bit more details in the commit log here, so
> that we understand exactly what it is fixing, and whether this fix
> should be pushed to the master branch or the next branch.
>
> Is it that with the current DESTDIR value, botan gets installed in
> STAGING_DIR/usr/usr ?
>
> Thanks,
>
> Thomas
