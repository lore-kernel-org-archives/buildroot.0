From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 04 Feb 2021 18:22:31 +0100
Subject: [Buildroot] [PATCH 1/1] package/cereal: fix CVE-2020-11105
In-Reply-To: <20210203201100.1153600-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 3 Feb 2021 21:11:00 +0100")
References: <20210203201100.1153600-1-fontaine.fabrice@gmail.com>
Message-ID: <87y2g3agtk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix CVE-2020-11105: An issue was discovered in USC iLab cereal through
 > 1.3.0. It employs caching of std::shared_ptr values, using the raw
 > pointer address as a unique identifier. This becomes problematic if an
 > std::shared_ptr variable goes out of scope and is freed, and a new
 > std::shared_ptr is allocated at the same address. Serialization fidelity
 > thereby becomes dependent upon memory layout. In short, serialized
 > std::shared_ptr variables cannot always be expected to serialize back
 > into their original values. This can have any number of consequences,
 > depending on the context within which this manifests.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
