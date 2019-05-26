From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 26 May 2019 14:20:17 +0200
Subject: [Buildroot] [PATCH v2,1/1] package/qt5enginio: needs ssl
In-Reply-To: <CAPi7W81Me3cZ56cZiesW_sxEz4-i2CsTPCLWL=AQ5fyo6fZaAQ@mail.gmail.com>
References: <20190505124731.18275-1-fontaine.fabrice@gmail.com>
 <3c08a2ee-d0d1-8ca2-ccf6-e411f0802344@mind.be>
 <CAPi7W81Me3cZ56cZiesW_sxEz4-i2CsTPCLWL=AQ5fyo6fZaAQ@mail.gmail.com>
Message-ID: <239da35a-5092-707c-97e5-b1eb024e7e08@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10/05/2019 22:57, Fabrice Fontaine wrote:
>>  This would still lead to autobuild failures for Qt5.6, of course, because it is
>> still possible to select libopenssl instead of libressl. But we don't test Qt5.6
>> in the autobuilders, so that's fine.
> Are you sure that we're not testing Qt5.6 in autobuilders?

 Thomas said so and I believed him :-)

> Here is the latest build failure on qt5enginio:
> http://autobuild.buildroot.org/results/969/969d38b9ff1db51959e68343cf6e932dc8645688/config.

 We don't actively select QT5.6 in the autobuilders, but there are some
toolchains that don't support Qt5.9+ so in these cases Qt5.6 is still selected.

> But I agree that perhaps we should remove Qt5.6 from autobuilders.

 Or remove Qt5.6 completely :-)

 Regards,
 Arnout
