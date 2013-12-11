From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 11 Dec 2013 07:28:35 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-12-09
In-Reply-To: <20131211043812.GA1217@tarshish>
References: <20131210073007.6A2C4100850@stock.ovh.net>
 <20131211043812.GA1217@tarshish>
Message-ID: <ad79e2e1-bce2-4354-8b64-7b2bc5082d0e@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch Siach <baruch@tkos.co.il> wrote:
>Hi Thomas, all,
>
>On Tue, Dec 10, 2013 at 08:30:07AM +0100, Thomas Petazzoni wrote:
>>     xtensa |                      m4-1.4.17 | NOK | http://autobuild.buildroot.net/results/0b9b3bb1791bbc9f902a23360c4540d90a0e05ca/
>>     xtensa |                      m4-1.4.17 | NOK | http://autobuild.buildroot.net/results/ffda6f3f64c612da999229226f699c01ccebe4c2/
>
>I'm struggling with this one. The configure script test for posix_spawn build 
>fails because it lacks '-lrt'. This causes m4 to use an internal 
>implementation that fails at build time for some other reason (haven't found 
>the reason for that yet).
>
>How can I add -lrt to the build test command line?

Isn't this by adding/setting the LIBS variable before
calling the macro that executes the test? 

Best regards,
Thomas
