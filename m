From: Thomas Preston <thomas.preston@codethink.co.uk>
Date: Wed, 15 Apr 2020 17:48:44 +0100
Subject: [Buildroot] [PATCH v2 3/5] testing/infra: Add docstrings to base
 test classes
In-Reply-To: <20200415164846.122126-1-thomas.preston@codethink.co.uk>
References: <20200415164846.122126-1-thomas.preston@codethink.co.uk>
Message-ID: <20200415164846.122126-4-thomas.preston@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It wasn't immediately obvious to me what the two Buildroot base test
classes were for, so add docstrings to explain the differences between
BRConfigTest and BRTest.

Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
---
 support/testing/infra/basetest.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/support/testing/infra/basetest.py b/support/testing/infra/basetest.py
index 5dc6034447..dec0ab7013 100644
--- a/support/testing/infra/basetest.py
+++ b/support/testing/infra/basetest.py
@@ -29,6 +29,7 @@ MINIMAL_CONFIG = \
 
 
 class BRConfigTest(unittest.TestCase):
+    """Test up to the configure stage."""
     config = None
     br2_external = list()
     downloaddir = None
@@ -66,6 +67,7 @@ class BRConfigTest(unittest.TestCase):
 
 
 class BRTest(BRConfigTest):
+    """Test up to the build stage and instantiate an emulator."""
     def __init__(self, names):
         super(BRTest, self).__init__(names)
         self.emulator = None
-- 
2.20.1
