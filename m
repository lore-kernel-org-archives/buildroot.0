From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 06 May 2013 13:30:58 +0200
Subject: [Buildroot] [PATCH 1/3] python-setuptools: forkbump and add
	workaround for shebang
In-Reply-To: <51878F08.2030804@zacarias.com.ar> (Gustavo Zacarias's message of
 "Mon, 06 May 2013 08:07:52 -0300")
References: <1365872210-20167-1-git-send-email-gustavo@zacarias.com.ar>
 <516CEF3C.6070505@mind.be> <516D254A.4010707@zacarias.com.ar>
 <87a9o8lfy6.fsf@dell.be.48ers.dk> <51878F08.2030804@zacarias.com.ar>
Message-ID: <87k3ncjqfh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> On 05/06/2013 04:34 AM, Peter Korsgaard wrote:
 >> Did this ever get tested? Thomas, could you send your ack / Gustavo,
 >> could you send a v2 fixing the issues pointed out by Arnout?

 Gustavo> It's partially solved for lava-test since it's pulling other
 Gustavo> dependencies by itself - that should probably be solved via new
 Gustavo> buildroot python packages since it's doing so because they're not found,
 Gustavo> and it's not nice when a package starts downloading stuff at
 Gustavo> build/install time.
 Gustavo> Yes, a V2 is forthcoming addressing Arnout's comments and a few more
 Gustavo> fixes/improvements.

Ok, great.

 Gustavo> You shouldn't have committed the fixes to python-bottle and
 Gustavo> python-serial since they both depend on the patch to this package,
 Gustavo> they'll probably fail now.

Hmm, odd - They built fine here:

>>> python-bottle 0.11.6 Building
(cd /home/peko/source/buildroot/output/build/python-bottle-0.11.6; /home/peko/source/buildroot/output/host/usr/bin/python setup.py build --executable=/usr/bin/python)
running build
running build_py
creating build
creating build/lib
copying bottle.py -> build/lib
running build_scripts
creating build/scripts-2.7
copying and adjusting bottle.py -> build/scripts-2.7
changing mode of build/scripts-2.7/bottle.py from 644 to 755

-- 
Bye, Peter Korsgaard
