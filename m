From: Erik Schumacher <schumacher574@gmail.com>
Date: Tue, 21 Nov 2017 12:29:10 -0800
Subject: [Buildroot] [PATCH 11/12] docker-engine: bump to v17.07.0-ce
Message-ID: <CALE803_CnXxuNxGd32J7sqoJtAragQ96xp0SCWuQbuqgbZiS1A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It seems the change to DOCKER_ENGINE_BUILD_CMDS for go build path (bin ->
usr) causes builds to fail:

-		$(HOST_DIR)/bin/go build -v \
-			-o $(@D)/bin/$(target) \
+		$(HOST_DIR)/usr/go build -v \
+			-o $(@D)/bin/$${targetbin} \

Not sure if this is due to another patch from another series that I may be
missing?  Switching path back to $(HOST_DIR)/bin/go causes builds to
succeed.

Thanks,
Erik
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171121/18f19bce/attachment.html>
