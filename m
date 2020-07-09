From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Thu, 09 Jul 2020 09:34:08 +0200
Subject: [Buildroot] [PATCH 1/9] support/scripts: Turn CVE check into a
 module
In-Reply-To: <20200708185427.6f536ad6@windsurf>
References: <20200708164006.859021-1-gregory.clement@bootlin.com>
 <20200708164006.859021-2-gregory.clement@bootlin.com>
 <20200708185427.6f536ad6@windsurf>
Message-ID: <871rll9m6n.fsf@FE-laptop>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

> On Wed,  8 Jul 2020 18:39:58 +0200
> Gregory CLEMENT <gregory.clement@bootlin.com> wrote:
>
>> In order to be able to do CVE checking outside of pkg-stat, move the
>> CVE class in a module that can be used by other scripts.
>> 
>> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
>> ---
>>  support/scripts/cve.py    | 141 ++++++++++++++++++++++++++++++++++++++
>>  support/scripts/pkg-stats | 115 +------------------------------
>>  2 files changed, 144 insertions(+), 112 deletions(-)
>>  create mode 100755 support/scripts/cve.py
>> 
>> diff --git a/support/scripts/cve.py b/support/scripts/cve.py
>> new file mode 100755
>> index 0000000000..874ab4482d
>> --- /dev/null
>> +++ b/support/scripts/cve.py
>> @@ -0,0 +1,141 @@
>> +#!/usr/bin/env python
>> +
>> +# Copyright (C) 2009 by Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>> +# Copyright (C) 2020 by Gregory CLEMENT <gregory.clement@bootlin.com>
>> +#
>> +# This program is free software; you can redistribute it and/or modify
>> +# it under the terms of the GNU General Public License as published by
>> +# the Free Software Foundation; either version 2 of the License, or
>> +# (at your option) any later version.
>> +#
>> +# This program is distributed in the hope that it will be useful,
>> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
>> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
>> +# General Public License for more details.
>> +#
>> +# You should have received a copy of the GNU General Public License
>> +# along with this program; if not, write to the Free Software
>> +# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
>> +
>> +import datetime
>> +import os
>> +import re
>> +import requests  # URL checking
>> +import json
>> +import ijson
>> +import distutils.version
>> +import time
>> +import gzip
>> +import sys
>
> Are you able to drop some of these imports from the pkg-stats script ?
> For example, isn't ijson only used by cve.py now ? Same for gzip, for
> distutils.version. Perhaps others ?

I removed some import in the cve.py but not in this file. I can do it,
indeed.

Gregory

>
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
