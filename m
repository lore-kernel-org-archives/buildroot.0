From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 05 Dec 2019 21:50:45 +0100
Subject: [Buildroot] [PATCH v2 2/2] package/opencv3: ensure the python
 module works when BR2_PACKAGE_PYTHON{, 3}_PYC_ONLY=y
In-Reply-To: <20191129190707.710738-3-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Fri, 29 Nov 2019 20:07:06 +0100")
References: <20191129190707.710738-1-thomas.petazzoni@bootlin.com>
 <20191129190707.710738-3-thomas.petazzoni@bootlin.com>
Message-ID: <871rtiqyxm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > The OpenCV Python module does a fairly strange thing to read a few
 > configuration details: it uses Python's execfile() to execute two .py
 > files and access a few variables. However, execfile() only works with
 > .py files and not .pyc files.

 > When BR2_PACKAGE_PYTHON{,3}_PYC_ONLY=y, the .py files are all removed,
 > causing the OpenCV Python module to not work:

 >   File "usr/lib/python3.7/site-packages/cv2/__init__.py", line 89, in <module>
 >   File "usr/lib/python3.7/site-packages/cv2/__init__.py", line 58, in bootstrap
 >   File "usr/lib/python3.7/site-packages/cv2/__init__.py", line 56, in load_first_config
 > ImportError: OpenCV loader: missing configuration file: ['config.py']. Check OpenCV installation.

 > To fix this problem, this commit uses the newly introduced
 > <pkg>_KEEP_PY_FILES mechanism, to ensure the important config*.py
 > files are kept.

 > Fixes:

 >   https://bugs.busybox.net/show_bug.cgi?id=12171

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2019.02.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
