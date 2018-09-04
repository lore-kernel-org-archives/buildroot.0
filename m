From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 04 Sep 2018 23:56:15 +0200
Subject: [Buildroot] [PATCH v3] mediastreamer: fix avcodec functions
 conflict
In-Reply-To: <735a4c9f-42c2-9744-6889-921bf720d167@micronovasrl.com> (Giulio
 Benetti's message of "Tue, 4 Sep 2018 23:34:13 +0200")
References: <20180904131251.30724-1-giulio.benetti@micronovasrl.com>
 <87va7lasjf.fsf@dell.be.48ers.dk>
 <735a4c9f-42c2-9744-6889-921bf720d167@micronovasrl.com>
Message-ID: <87in3lapvk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@micronovasrl.com> writes:

Hi,

 >> Committed after extending the commit message to clarify that this is
 >> about static linking, thanks.

 > Sorry for my ignorance, so library order during linking is an issue only
 > with static libraries?

Yes, when statically linking ld will only pull in the object files
containing referenced symbols, so you need to list the libraries in the
dependency order (E.G. if you call a function in library a that in turn
calls a function in library b then you must use -la -b).

For details, see
E.G. https://eli.thegreenplace.net/2013/07/09/library-order-in-static-linking

-- 
Bye, Peter Korsgaard
