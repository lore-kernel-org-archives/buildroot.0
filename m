From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 22 Jul 2020 09:05:43 +0200
Subject: [Buildroot] [PATCH] package/python-urllib3: security bump to
 1.25.9
In-Reply-To: <20200714200202.56068-1-matthew.weber@rockwellcollins.com> (Matt
 Weber's message of "Tue, 14 Jul 2020 15:02:02 -0500")
References: <20200714200202.56068-1-matthew.weber@rockwellcollins.com>
Message-ID: <87tuy0jago.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matt" == Matt Weber <matthew.weber@rockwellcollins.com> writes:

 > Fixes CVE-2020-7212 (1.25.2 - 1.25.7)
 > The _encode_invalid_chars function does not remove duplicate percent
 > encodings in the _percent_encodings array, which combined with the
 > normalization step could take O(N^2) time to compute for a URL of
 > length N. This results in a marginally higher CPU consumption
 > compared to the potential linear time achieved by deduplicating
 > the _percent_encodings array.

 > CC: Peter Korsgaard <peter@korsgaard.com>
 > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
 > --

 > Also applies to 2020.02.x

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
