From: Shawn J. Goff <shawn7400@gmail.com>
Date: Fri, 6 Jan 2012 07:47:38 -0500
Subject: [Buildroot] customize package: odd copy construction
In-Reply-To: <CAAXf6LW1GnqA3fgU9zGXXMdevw+FxCBN2x4PUpCzxM-cHYJeUA@mail.gmail.com>
References: <CAAXf6LW1GnqA3fgU9zGXXMdevw+FxCBN2x4PUpCzxM-cHYJeUA@mail.gmail.com>
Message-ID: <CAGiDA6+R=GOPwLtscwM4oLE434sHjRDAa=5qZCCygiLroHCE2g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> ? ? ? ?rm -f $(BUILD_DIR)/series
> ? ? ? ?(cd $(CUST_DIR); \
> ? ? ? ? /bin/ls -d * > $(BUILD_DIR)/series || \
> ? ? ? ? touch $(BUILD_DIR)/series )
> ? ? ? ?for f in `cat $(BUILD_DIR)/series`; do \
> ? ? ? ? ? ? ? ?cp -af $(CUST_DIR)/$$f $(TARGET_DIR); \
> ? ? ? ?done
> ? ? ? ?rm -f $(BUILD_DIR)/series
>
> This was changed from:
> ? ? ? ?-cp -af $(CUST_DIR)/* $(TARGET_DIR)/
>

In addition to being downright strange, this will fail in not obvious
ways if, for example, one of the directories has a newline character.
