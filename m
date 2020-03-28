From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sat, 28 Mar 2020 14:26:50 -0700
Subject: [Buildroot] [PATCH 1/1]
 support/testing/tests/package/sample_gst1_python.py: fix flake8 errors
Message-ID: <20200328212651.2715515-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

The older version of flake8 on the autobuilders does not support typehints.
As such, flake8 throws the following error when scanning sample_gst1_python:
E999 SyntaxError: invalid syntax

Remove the typehinting from on_message to fix this issue.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 support/testing/tests/package/sample_gst1_python.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/sample_gst1_python.py b/support/testing/tests/package/sample_gst1_python.py
index d8cd3fb422..fab7e74f40 100644
--- a/support/testing/tests/package/sample_gst1_python.py
+++ b/support/testing/tests/package/sample_gst1_python.py
@@ -8,7 +8,7 @@ gi.require_version('Gst', '1.0')
 from gi.repository import Gst, GLib  # noqa: E402
 
 
-def on_message(bus: Gst.Bus, message: Gst.Message, loop: GLib.MainLoop):
+def on_message(bus, message, loop):
     print('Received Gst.Message.type: {}'.format(message.type))
     if message.type == Gst.MessageType.EOS:
         loop.quit()
-- 
2.25.1
