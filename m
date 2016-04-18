From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 18 Apr 2016 12:53:03 +0100
Subject: [Buildroot] [PATCH v2 0/8] php: bump version to 7.0.5
Message-ID: <1460980391-65336-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series bumps PHP to version 7.0.5.

It starts by bumping some external modules which can be built for both
PHP 5 and PHP 7.

Then it deletes the external modules which are not compatible with PHP 7
and their new versions are not compatible with PHP 5 either (so they
cannot be bumped like the other ones).

After that, it performs the PHP version bump to 7.0.5.

Finally the deleted modules are re added at a version compatible with
PHP 7.

Changes v1 -> v2:
 - Split the patch in multiple patches for the sake of bisectability.

Vicente Olivert Riera (8):
  php-geoip: bump version to HEAD of master on GitHub
  php-imagick: bump version to 3.4.1
  php-zmq: bump version to 1.1.3
  php: bump version to 7.0.5
  php-gnupg: re add package, now compatible with PHP 7
  php-memcached: re add package, now compatible with PHP 7
  php-ssh2: re add package, now compatible with PHP 7
  php-yaml: re add package, now compatible with PHP 7

 package/php-geoip/php-geoip.hash         | 2 +-
 package/php-geoip/php-geoip.mk           | 6 ++----
 package/php-gnupg/php-gnupg.hash         | 2 +-
 package/php-gnupg/php-gnupg.mk           | 5 ++---
 package/php-imagick/php-imagick.hash     | 2 +-
 package/php-imagick/php-imagick.mk       | 5 ++---
 package/php-memcached/php-memcached.hash | 2 +-
 package/php-memcached/php-memcached.mk   | 6 ++----
 package/php-ssh2/php-ssh2.hash           | 2 +-
 package/php-ssh2/php-ssh2.mk             | 6 ++----
 package/php-yaml/php-yaml.hash           | 2 +-
 package/php-yaml/php-yaml.mk             | 5 ++---
 package/php-zmq/php-zmq.hash             | 2 +-
 package/php-zmq/php-zmq.mk               | 5 ++---
 package/php/php.hash                     | 2 +-
 package/php/php.mk                       | 2 +-
 16 files changed, 23 insertions(+), 33 deletions(-)

-- 
2.7.3
