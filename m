From: Alexander Dahl <post@lespocky.de>
Date: Tue, 22 Jan 2019 15:37:44 +0100
Subject: [Buildroot] Downloading at91bootstrap3 fails on recent master?
Message-ID: <20190122143744.j5n5os57dcsds7qr@falbala.home.lespocky.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hei hei,

I just pulled current master (2018.11-829-gd078cecdcf) and tried
building atmel_sama5d27_som1_ek_mmc_dev_defconfig, like this:

(Note, env variable BR2_DL_DIR is set to:
'/home/adahl/mnt/bagend-ia/src_archive'.)

	rm -rf /home/adahl/mnt/bagend-ia/src_archive/at91bootstrap3
	make distclean
	make atmel_sama5d27_som1_ek_mmc_dev_defconfig
	make

This fails on downloading at91bootstrap3:

	>>> at91bootstrap3 v3.8.10 Downloading
	/home/adahl/mnt/bagend-ia/src_archive/at91bootstrap3/git/.git: Datei oder Verzeichnis nicht gefunden
	Detected a corrupted git cache.
	Removing it and starting afresh.
	/home/adahl/mnt/bagend-ia/src_archive/at91bootstrap3/git/.git: Datei oder Verzeichnis nicht gefunden
	Detected a corrupted git cache.
	This is the second time in a row; bailing out
	--2019-01-22 15:00:27--  http://sources.buildroot.net/at91bootstrap3/at91bootstrap3-v3.8.10.tar.gz
	Aufl?sen des Hostnamens ?sources.buildroot.net (sources.buildroot.net)? ? 104.25.211.19, 104.25.210.19, 2606:4700:20::6819:d213, ...
	Verbindungsaufbau zu sources.buildroot.net (sources.buildroot.net)|104.25.211.19|:80 ? verbunden.
	HTTP-Anforderung gesendet, auf Antwort wird gewartet ? 404 Not Found
	2019-01-22 15:00:28 FEHLER 404: Not Found.

	--2019-01-22 15:00:28--  http://sources.buildroot.net/at91bootstrap3-v3.8.10.tar.gz
	Aufl?sen des Hostnamens ?sources.buildroot.net (sources.buildroot.net)? ? 104.25.210.19, 104.25.211.19, 2606:4700:20::6819:d313, ...
	Verbindungsaufbau zu sources.buildroot.net (sources.buildroot.net)|104.25.210.19|:80 ? verbunden.
	HTTP-Anforderung gesendet, auf Antwort wird gewartet ? 404 Not Found
	2019-01-22 15:00:28 FEHLER 404: Not Found.

	package/pkg-generic.mk:135: die Regel f?r Ziel ?/mnt/data/adahl/src/buildroot/output/build/at91bootstrap3-v3.8.10/.stamp_downloaded? scheiterte
	make: *** [/mnt/data/adahl/src/buildroot/output/build/at91bootstrap3-v3.8.10/.stamp_downloaded] Fehler 1

The relevant part from the defconfig is:

    BR2_TARGET_AT91BOOTSTRAP3=y
    BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
    BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
    BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.8.10"
    BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama5d27_som1_eksd_uboot"

The repository exists, the tag exists in the repository, so I would
assume that should work. I tried building with `make V=1 -j1`, but
that gave me no clue on what's going on wrong. :-/

Appreciate any hints.

Greets
Alex

-- 
/"\ ASCII RIBBON | ?With the first link, the chain is forged. The first
\ / CAMPAIGN     | speech censured, the first thought forbidden, the
 X  AGAINST      | first freedom denied, chains us all irrevocably.?
/ \ HTML MAIL    | (Jean-Luc Picard, quoting Judge Aaron Satie)
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190122/347bb70f/attachment.asc>
