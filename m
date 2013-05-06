From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 06 May 2013 08:07:52 -0300
Subject: [Buildroot] [PATCH 1/3] python-setuptools: forkbump and add
 workaround for shebang
In-Reply-To: <87a9o8lfy6.fsf@dell.be.48ers.dk>
References: <1365872210-20167-1-git-send-email-gustavo@zacarias.com.ar>
 <516CEF3C.6070505@mind.be> <516D254A.4010707@zacarias.com.ar>
 <87a9o8lfy6.fsf@dell.be.48ers.dk>
Message-ID: <51878F08.2030804@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/06/2013 04:34 AM, Peter Korsgaard wrote:

> Did this ever get tested? Thomas, could you send your ack / Gustavo,
> could you send a v2 fixing the issues pointed out by Arnout?

It's partially solved for lava-test since it's pulling other
dependencies by itself - that should probably be solved via new
buildroot python packages since it's doing so because they're not found,
and it's not nice when a package starts downloading stuff at
build/install time.
Yes, a V2 is forthcoming addressing Arnout's comments and a few more
fixes/improvements.
You shouldn't have committed the fixes to python-bottle and
python-serial since they both depend on the patch to this package,
they'll probably fail now.
Regards.
