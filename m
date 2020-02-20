From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 Feb 2020 21:31:59 +0100
Subject: [Buildroot] [PATCH 1/1] support/scripts/pkg-stats: iterate over
 CVEs in streaming
In-Reply-To: <CAAXf6LXfTgKQT8Ua8Hqs0MZDp0961Eh+-_aMcxqC_VE8mMSqmQ@mail.gmail.com>
 (Thomas De Schampheleire's message of "Thu, 20 Feb 2020 21:11:15
 +0100")
References: <20200220182723.52615-1-titouan.christophe@railnova.eu>
 <CAAXf6LXfTgKQT8Ua8Hqs0MZDp0961Eh+-_aMcxqC_VE8mMSqmQ@mail.gmail.com>
Message-ID: <87a75d2e68.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> writes:

 > Hi Titouan,
 > El jue., 20 feb. 2020 a las 19:27, Titouan Christophe
 > (<titouan.christophe@railnova.eu>) escribi?:
 >> 
 >> The NVD files that are used to build the list of CVEs affecting
 >> Buildroot packages are quite large (a few hundreds MB of json),
 >> and cause the pkg-stats scripts to have a huge memory footprint
 >> (a few GB with Python 2.7).
 >> 
 >> However, because we only need to iterate on CVE items one by one,
 >> we can process them in streaming (ie decoding one CVE at a time
 >> from the JSON representation). Because the json module from the
 >> python standard library does not support such a mode of operation,
 >> we switch to the third-party package ijson, which is compatible
 >> with both Python 2 and Python3.
 >> 
 >> To run the script with these modifications, one should install
 >> the ijson python package. This can be done with pip:
 >> `pip install ijson`. On Debian based distributions, this can
 >> also be done with the apt package manager:
 >> `apt install python-ijson`.
 >> 
 >> Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>

 > This is _way_ better. In my test run observing top output, resident
 > memory stayed around 50 MB.

Nice!

 > Reviewed-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 > Tested-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
