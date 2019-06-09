From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 9 Jun 2019 23:40:08 +0200
Subject: [Buildroot] [git commit] package/luarocks: fix test file creation
 on br-external
Message-ID: <20190609213952.2E8EE8E2E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=de1313fb06c704a51f675bd3c235e53258f31e73
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

first, add the creation of the needed subdirectories

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/luarocks/buildroot.lua | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/luarocks/buildroot.lua b/package/luarocks/buildroot.lua
index 39f0fe759e..35223c1192 100644
--- a/package/luarocks/buildroot.lua
+++ b/package/luarocks/buildroot.lua
@@ -400,6 +400,8 @@ function buildroot.command(flags, rockname, fsname)
    generate_mk(rockspec, fsname:lower(), licenses)
    generate_hash(rockspec, fsname:lower(), rock_file, licenses, digest)
    if has_c_files(rockspec) then
+      ok, err = fs.make_dir('support/testing/tests/package')
+      if not ok then return nil, err end
       generate_test(rockspec, fsname:lower())
    end
 
