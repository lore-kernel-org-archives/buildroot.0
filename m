From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Sep 2014 17:29:23 +0200
Subject: [Buildroot] [PATCH 3/6] python-rtslib-fb: new package
In-Reply-To: <20140917172111.570fa8c1@grp-cvubrugier>
References: <1410953999-16520-1-git-send-email-cvubrugier@fastmail.fm>
 <1410953999-16520-4-git-send-email-cvubrugier@fastmail.fm>
 <20140917140059.0eee9af9@free-electrons.com>
 <20140917151302.08303544@grp-cvubrugier>
 <20140917151552.6d0d0e91@free-electrons.com>
 <20140917172111.570fa8c1@grp-cvubrugier>
Message-ID: <20140917172923.11d303c2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Christophe Vu-Brugier,

On Wed, 17 Sep 2014 17:21:11 +0200, Christophe Vu-Brugier wrote:

> The only "issue" I face at the moment is with pyparsing. I get an
> ImportError when I try to import this module from Python 3. I think the
> module is correctly installed: I compared the installation in Buildroot
> and in a virtualenv and the only difference I see is that a
> "pyparsing.py" file is installed in "site-packages/" in my virtualenv.
> 
> It is expected since BR2_PACKAGE_PYTHON3_PYC_ONLY is selected. If I
> select BR2_PACKAGE_PYTHON3_PY_PYC instead, then importing the pyparsing
> module works.
> 
> I don't know how to properly fix this. What would you suggest?

Aah, yes, sorry, not your fault. There is an issue with Python 3 and
external modules in the BR2_PACKAGE_PYTHON3_PYC_ONLY case, caused by
PEP 3147. There is a patch pending at
http://patchwork.ozlabs.org/patch/373082/ to solve this, but I'm not
really happy with the proposed solution, and I wanted to investigate
this a bit more. Which I've started to do, but of course didn't had
enough time to come to a conclusion.

For the time being, either apply the patch mentioned above, or use
BR2_PACKAGE_PYTHON3_PY_PYC.

Sorry again :/

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
