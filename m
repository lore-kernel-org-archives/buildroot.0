From: Grzegorz Blach <grzegorz@blach.pl>
Date: Wed, 29 Aug 2018 22:25:30 +0200
Subject: [Buildroot] [PATCH 2/2] python-falcon: new package
In-Reply-To: <20180829214758.718d5e7f@windsurf>
References: <20180828101618.4746-1-grzegorz@blach.pl>
 <20180828101618.4746-2-grzegorz@blach.pl>
 <CAMWSM7jvM=oqzCns6RAx32RDDdnFF0ikvhMjXdDCPRoB_d27cA@mail.gmail.com>
 <20180829214758.718d5e7f@windsurf>
Message-ID: <32a0a4a5-a2c4-c42b-50b4-5e618eaf73ef@blach.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/29/2018 09:47 PM, Thomas Petazzoni wrote:
> Hello Joseph,
> 
> On Tue, 28 Aug 2018 09:34:56 -0700, Joseph Kogut wrote:
> 
>> I know python-falcon supports compiling itself using Cython, would it
>> be helpful to do something like:
>>
>> ifeq ($(BR2_PACKAGE_HOST_PYTHON_CYTHON),y)
>> PYTHON_FALCON_DEPENDENCIES += host-cython
>> endif
> 
> I am not very familiar with Cython. How does that work, what does that
> do ? Is it sufficient for Cython to be installed in $(HOST_DIR) to
> allow python-falcon to detect it and use it ?
> 

If BR2_PACKAGE_HOST_PYTHON_CYTHON is enabled in config, Falcon uses 
Cython to compile own code.  Cython on target is not required in this 
case.  Settings PYTHON_FALCON_DEPENDENCIES += host-python-cython
in python-falcon/Config.in also is not required, but may be usable to 
guarantee, that host-python-cython is always installed
before python-falcon.

>> So that if host-cython is selected, python-falcon will utilize it during setup?
>>
>> It might also be helpful to mention in the help text that the package
>> will optionally compile with Cython for enhanced performance, though
>> I'm not sure if that's the Buildroot way of doing things, maybe
>> someone else can chime in.
> 
> Yes, if there are some optional dependencies, we can mention them in
> the package Config.in help text.
> 
> Could you provide a follow-up adding this Cython support in
> python-falcon ?
> 
> Thanks!
> 
> Thomas
> 
