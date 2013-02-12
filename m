From: Patrick <kpa_info@yahoo.fr>
Date: Tue, 12 Feb 2013 16:20:53 +0100
Subject: [Buildroot] [PATCH v2] Python 3, simple,
	external package support
In-Reply-To: <20130212155333.1cf75e26@skate>
References: <1360678441-3199-1-git-send-email-kpa_info@yahoo.fr>
 <20130212152155.0d3c5301@skate> <511A54EE.5010509@yahoo.fr>
 <20130212155333.1cf75e26@skate>
Message-ID: <511A5DD5.1030005@yahoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/12/2013 03:53 PM, Thomas Petazzoni wrote:
> Dear Patrick,
>
> On Tue, 12 Feb 2013 15:42:54 +0100, Patrick wrote:
>
>> Related with host-python, the only difference is that now the patch add
>> a symlink in  HOST_DIR. I agree that this could be a problem.
>>
>> I could edit the external python package to use "python" or "python3"
>> depending of the selected version. This will not impact host-python at
>> all. Does it seems good to you ?
>
> No, it doesn't solve the problem of packages that currently depend on
> host-python, and that expect a Python 2 to be installed.
>
> You seem to be focused only on Python external modules, but you
> completely forget that there are packages in Buildroot that depend on
> host-python as their build dependencies, even though those packages are
> not directly Python related.
>
> For example, are you sure that mesa3d and libxcb will built properly
> once host-python is Python 3 ?
>
> Thomas
>
Thomas, I am aware that there is others packages that depends on 
host-python, mostly x11. But I have not changed the way host-python nor 
host-python3 are build and used. I don't understand how the changes I 
have made could break this compared as previously ? If I'm not mistaken, 
host-python is selected directly by the package (mesa3d for example) 
when needed, and this is independent of the selected python package, right ?

Patrick
