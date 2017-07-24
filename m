From: Hugues FRUCHET <hugues.fruchet@st.com>
Date: Mon, 24 Jul 2017 08:14:38 +0000
Subject: [Buildroot] [RFC v1] libv4l: build utils only on MMU (with fork
 support) platforms
In-Reply-To: <20170722214425.5c9ab5a8@windsurf>
References: <20170711172624.7516-1-ps.report@gmx.net>
 <70ff5d21-0466-c470-cac3-e00c524c93b0@st.com>
 <20170717200901.51814cb5@gmx.net>
 <41bd7a05-4254-e7e4-7846-ed5e4d99d0ad@st.com>
 <20170722214425.5c9ab5a8@windsurf>
Message-ID: <1919f249-f594-1021-89b5-080b9277244b@st.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 07/22/2017 09:44 PM, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 18 Jul 2017 09:08:18 +0000, Hugues FRUCHET wrote:
> 
>> Back to your exact build issue, the best fix on my opinion is to add a
>> dependency on fork() symbol in configure.ac instead of the one proposed
>> in libv4l.mk, find attached a patch proposal.
> 
> Does your patch actually work? A lot of the utils in utils/ do require
> the libraries, won't they fail to build if the libraries are not built ?
Those which depends on libraries won't be built, but some will remains 
built, as the compliancy tools. This was the aim of the initial patch.

> 
> Could you make a clean patch submission to resolve this issue ?
There was a typo in proposed patch, I've sent to Peter a fixed version.
When build is confirmed OK by Peter, I'll push to both V4L2 and 
buildroot lists.

> 
> Thanks,
> 
> Thomas
> 

BR,
Hugues.
