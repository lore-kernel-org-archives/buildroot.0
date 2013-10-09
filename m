From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 9 Oct 2013 15:46:11 +0200
Subject: [Buildroot] [PATCH] libxmlrpc: new package
In-Reply-To: <CAM+bi4u_0_EKNGwJVfdpDQYjPVPCRCSNdvYUs_06mYuwRT-5oA@mail.gmail.com>
References: <CAM+bi4vJbFEGdDKMjJxesqR8T=g=KQkgeZpaLNy=1L_FsDkrPA@mail.gmail.com>
 <1381320976-948-1-git-send-email-alvaro.gamez@hazent.com>
 <CAAXf6LUo7nVgHoRNy5aqseXEijPACxsp7NwVJSUQ-q_bQR0VMw@mail.gmail.com>
 <CAM+bi4u_0_EKNGwJVfdpDQYjPVPCRCSNdvYUs_06mYuwRT-5oA@mail.gmail.com>
Message-ID: <CAAXf6LWA2aDYi0OoLeOD5OLVRSCtz9BQvcXOuQGhVa4SZpA-aw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alvaro,

On Wed, Oct 9, 2013 at 3:21 PM, Alvaro Gamez <alvaro.gamez@hazent.com> wrote:
>>
>> > +LIBXMLRPC_LICENSE = BSD-like, Expat, Python 1.5.2 License
>> > +LIBXMLRPC_LICENSE_FILES = doc/COPYING
>>
>> Are these three licenses used on identifyable parts of libxmlrpc, such
>> that you could be more specific, like
>> BSD-like (partA), Expat (partB) etc.?
>>
>> Also, what exactly do you mean with BSD-like? Is it possible to map
>> onto one of the standard strings specified in
>>
>> http://buildroot.uclibc.org/downloads/manual/manual.html#legal-info-list-licenses
>> ?
>>
>> And finally, if there are three licenses, I'd expect three license
>> files, unless the file doc/COPYING accumulates the license texts of
>> all three licenses. Can you confirm?
>
>
> Yes, the file doc/COPYING contains the three license texts. It explains
> which license applies to what:
>
> You can read it here
>
> http://sourceforge.net/p/xmlrpc-c/code/HEAD/tree/trunk/doc/COPYING
>
> and I'll comment a little on everything:
>
>
>> All the code written specifically for Xmlrpc-c, which is most
>> of the code, and the aggregation, is licensed under the
>> XML-RPC FOR C/C++ license shown below.
>
> This license is, as I understand it, is basically just BSD-3c, I guess.
>
>
>> The Expat Licence applies to the contents of the directory lib/expat,
>
> This is kind of a BSD license where "everything" is allowed with only one
> requisite
> "The above copyright notice and this permission notice shall be included
> in all copies or substantial portions of the Software."
>
>
>> the ABYSS Web Server License applies to the contents of the directory
>> lib/abyss and parts of the file src/xmlrpc_abyss.c.
>
> This is again BSD-3c license, I think
>
>
>> The Python 1.5.2 license applies to parts of the file
>> src/xmlrpc_base64.c.
>
>
> I guess I could just type all that as
>
> BSD-3c (xml-rpc main code, lib/expat and abyss web server), Python 1.5.2
> license (xmlrpc_base64.c)
>
> What do you think?

I think this is clearer, yes.
Note that doc/COPYING says 'parts of src/xmlrpc_base64.c' so I would
reproduce that text as-is.

Thanks,
Thomas
