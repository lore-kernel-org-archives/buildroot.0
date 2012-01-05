From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 5 Jan 2012 16:23:23 +0100
Subject: [Buildroot] customize package: odd copy construction
Message-ID: <CAAXf6LW1GnqA3fgU9zGXXMdevw+FxCBN2x4PUpCzxM-cHYJeUA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

The customize uses an odd copy construction that I can't really explain:

        rm -f $(BUILD_DIR)/series
        (cd $(CUST_DIR); \
         /bin/ls -d * > $(BUILD_DIR)/series || \
         touch $(BUILD_DIR)/series )
        for f in `cat $(BUILD_DIR)/series`; do \
                cp -af $(CUST_DIR)/$$f $(TARGET_DIR); \
        done
        rm -f $(BUILD_DIR)/series

This was changed from:
        -cp -af $(CUST_DIR)/* $(TARGET_DIR)/

in the following commit:
http://git.buildroot.org/buildroot/commit/?id=06cc62f9cfbe43e9d31a07667a6af905b5f34a42

Why would you create a series file first if you're removing it
immediately afterwards?
Doesn't the original copy statement do exactly the same?

Thanks,
Thomas
