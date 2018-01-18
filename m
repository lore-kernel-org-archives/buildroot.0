From: Joel Stanley <joel@jms.id.au>
Date: Thu, 18 Jan 2018 10:25:26 -0600
Subject: [Buildroot] [PATCH] gcc: Update or1k GCC tarball hash
Message-ID: <20180118162526.20572-1-joel@jms.id.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When doing a build today I noticed the GCC tarball from Github has
changed hash.

  >>> host-gcc-initial musl-5.4.0 Downloading
  --2018-01-17 10:27:28--  https://github.com/openrisc/or1k-gcc/archive/musl-5.4.0/gcc-musl-5.4.0.tar.gz
  Resolving github.com (github.com)... 192.30.253.112, 192.30.253.113
  Connecting to github.com (github.com)|192.30.253.112|:443... connected.
  HTTP request sent, awaiting response... 302 Found
  Location: https://codeload.github.com/openrisc/or1k-gcc/tar.gz/musl-5.4.0 [following]
  --2018-01-17 10:27:29--  https://codeload.github.com/openrisc/or1k-gcc/tar.gz/musl-5.4.0
  Resolving codeload.github.com (codeload.github.com)... 192.30.253.121, 192.30.253.120
  Connecting to codeload.github.com (codeload.github.com)|192.30.253.121|:443... connected.
  HTTP request sent, awaiting response... 200 OK
  Length: unspecified [application/x-gzip]
  Saving to: 'output/build/.gcc-musl-5.4.0.tar.gz.1hqnIC/output?

  [        <=>                            ] 107.35M   822KB/s    in 2m 27s

  2018-01-17 10:29:58 (748 KB/s) - 'output/build/.gcc-musl-5.4.0.tar.gz.1hqnIC/output? saved [112562068]

  ERROR: gcc-musl-5.4.0.tar.gz has wrong sha512 hash:
  ERROR: expected: 841101f7de45f327bf2e92f3efc73ca88a021e4b9b541458ce80a16e55882bd8606a8492d75c57c589ee2c10d42ae2865b67690155d7289a541df1d68096402f
  ERROR: got     : 1ffbf4ec610b39107e4bb6224682aa6f49513f3fc96c137278b5d56db22db458f08b8b6e78c3940c00116b6e8e158410c1d337f666ec10cfdc4f0b6540b4b428
  ERROR: Incomplete download, or man-in-the-middle (MITM) attack

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
The tarball mirrored on buildroot.net needs to be updated

 package/gcc/gcc.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index 76be4552c941..c0ea7e55eb7a 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -10,4 +10,4 @@ sha512  f853cd6530b4055d8d8289da74687cb4c6d5f363598d386332d31852b581bac76c3adb7d
 # Locally calculated (fetched from Github)
 sha512  c30addd3c4dc66b90749a0f99b257c8a8e7966d27f286057b6b66f4a70ca22a1ee50d92882c4db13307d769a6fb28e1e2a2bab749a692cf3f89ef0c38f145efa  gcc-arc-2017.09-release.tar.gz
 # Locally calculated (fetched from Github)
-sha512  841101f7de45f327bf2e92f3efc73ca88a021e4b9b541458ce80a16e55882bd8606a8492d75c57c589ee2c10d42ae2865b67690155d7289a541df1d68096402f  gcc-musl-5.4.0.tar.gz
+sha512  1ffbf4ec610b39107e4bb6224682aa6f49513f3fc96c137278b5d56db22db458f08b8b6e78c3940c00116b6e8e158410c1d337f666ec10cfdc4f0b6540b4b428 gcc-musl-5.4.0.tar.gz
-- 
2.15.1
